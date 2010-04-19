plot.fs.n1.class <-
function(x,
         cutoff=default.cutoff,
         lwd=default.lwd,
         lty=default.lty,
         col=default.col,
         ylim=default.ylim,
         xlim=default.xlim, ...){
N <- x$data$N
default.cutoff <- x$cutoff
n1 <- min(which(x$number.unique.subsample < cutoff))
default.col <- 1
default.lty <- 1
default.lwd <- 2
default.ylim <- c(0,x$B)
default.xlim <- c(1,N)
plot(1:N, x$number.unique.subsample, type="l", ylab="Number unique subsamples", xlab="Subsample size n", las=1, col=col, lty=lty, lwd=lwd, ylim=ylim, xlim=xlim)
segments(min(xlim), cutoff, max(xlim), cutoff, col=1, lty="22")
axis(1, at=n1, labels=expression(italic(n[1])), tick=TRUE, padj=-1.3)
}
