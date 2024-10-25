mutate_proj <- function(data_tbl, a) {
  data_mat <- as.matrix(data_tbl)
  proj_len <- (data_mat %*% as.matrix(a, ncol = 1)) / sum(a^2)
  cn_vec <- c(colnames(data_tbl), c("proj_x", "proj_y"))
  data_out <- data_tbl |>
    dplyr::mutate(
      proj_x = as.numeric(proj_len) * a[1],
      proj_y = as.numeric(proj_len) * a[2]
    )
  colnames(data_out) <- cn_vec
  data_out |>
    dplyr::mutate(,
      origin = 0,
      a1 = a[1],
      a2 = a[2],
      "proj" = paste0("(", a[1] |> signif(2), ", ", a[2] |> signif(2), ")")
    )
}
