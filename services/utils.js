function raminfo()  {
    memfile.reload()


    var content = memfile.text();

//    console.log(content)
    if (content === "") return;

    let  lines = content.split("\n")

    var stats = {}
    for (let line of lines) {
	let parts = line.split(/\s+/);
	if (parts.length >= 2) {
	    let key = parts[0].slice(0,-1)
	    let value = parseFloat(parts[1])
	    stats[key] = value;
	}
    }

    //    console.log(stats)

    totalMem = stats.MemTotal
    availableMem = stats.MemAvailable
    freeMem = stats.MemFree

}




function formatSize(val) {

    let sizes = ["kb", "mb", "gb", "tb"]

    let counter = 0


    while ( val > 1024) {
	val = val / 1024
	counter = counter +1

    }

    return Math.round(val * 100) / 100 + sizes[counter]
    }

    



function cpuinfo() {
    cpufile.reload()
   let content = cpufile.text();

        if (content === "") {
            return;
        }

        let lines = content.split('\n');
        let currentStats = [];

        // Parse lines starting with "cpu" (cpu, cpu0, cpu1, ...)
        for (let i = 0; i < lines.length; ++i) {
            let line = lines[i].trim();
            if (line.startsWith('cpu')) {
                let parts = line.split(/\s+/);
                if (parts.length >= 8) {
                    let user = parseInt(parts[1]);
                    let nice = parseInt(parts[2]);
                    let system = parseInt(parts[3]);
                    let idle = parseInt(parts[4]);
                    let iowait = parseInt(parts[5]);
                    let irq = parseInt(parts[6]);
                    let softirq = parseInt(parts[7]);
                    // Total ticks: sum of all except idle for denominator
                    let total = user + nice + system + idle + iowait + irq + softirq;
                    currentStats.push({ total: total, idle: idle });
                }
            }
        }

        if (prevStats.length === currentStats.length && prevStats.length > 0) {
            let totalUsage = 0.0;
            let coreUsagesTemp = [];

            // Calculate for each core (skip overall "cpu")
            for (let j = 1; j < currentStats.length; ++j) {
                let current = currentStats[j];
                let prev = prevStats[j];
                let deltaTotal = current.total - prev.total;
                let deltaIdle = current.idle - prev.idle;
                let usage = (deltaTotal > 0) ? (deltaTotal - deltaIdle) / deltaTotal : 0.0;
                usage = Math.min(Math.max(usage, 0.0), 1.0);
                coreUsagesTemp.push(usage);
            }

            // Overall usage
            let overallCurrent = currentStats[0];
            let overallPrev = prevStats[0];
            let overallDeltaTotal = overallCurrent.total - overallPrev.total;
            let overallDeltaIdle = overallCurrent.idle - overallPrev.idle;
            totalUsage = (overallDeltaTotal > 0) ? (overallDeltaTotal - overallDeltaIdle) / overallDeltaTotal : 0.0;
            totalUsage = Math.min(Math.max(totalUsage, 0.0), 1.0);

            coreUsages = coreUsagesTemp;
            overallUsage = totalUsage;
        } else if (prevStats.length === 0) {
            // First run: Store baselines
            prevStats = currentStats;
        }

        prevStats = currentStats;
    }



