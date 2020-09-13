# 総計PositiveSparkline  ====
output$pcrSparkLine <- renderSparkline({
  sparkline(
    tail(mhlwSummary[, .(cumsum = sum(Positive, na.rm = T)), by = "date"][, .(diff = cumsum - shift(cumsum))], n = 28)[[1]],
    type = "bar", width = 100, barColor = "white"
  )
})

output$confirmedSparkLine <- renderSparkline({
  value <- rowSums(byDate[, 2:ncol(byDate), with = T])
  value <- value[(length(value) - 28):length(value)]
  sparkline(value, type = "bar", width = 100, barColor = "white")
})

output$dischargeSparkLine <- renderSparkline({
  sparkline(
    tail(mhlwSummary[, .(cumsum = sum(Discharged, na.rm = T)), by = "date"][, .(diff = cumsum - shift(cumsum))], n = 28)[[1]],
    type = "bar", width = 100, barColor = "white"
  )
})

output$deathSparkLine <- renderSparkline({
  value <- rowSums(death[, 2:ncol(death), with = T])
  value <- value[(length(value) - 28):length(value)]
  sparkline(value, type = "bar", width = 100, barColor = "white")
})
