#!/usr/bin/gnuplot
reset

set terminal pngcairo size 1280,720 enhanced notransparent font 'Verdana,12'
set output '/home/arogowie/repos/rd/ridge_detection/tests/test_spatial_histogram/img/f_GeForce GTX TITAN__bandwidth_v3.png'

set border 3 back lc rgb '#808080' lt 1.5
set grid back lc rgb '#808080' lt 0 lw 1

set style line 1 pt 1 ps 1 lt 1 lw 2 lc rgb '#D53E4F'
set style line 2 pt 2 ps 1 lt 1 lw 2 lc rgb '#F46D43'
set style line 3 pt 3 ps 1 lt 1 lw 2 lc rgb '#FDAE61'
set style line 4 pt 4 ps 1 lt 1 lw 2 lc rgb '#FEE08B'
set style line 5 pt 5 ps 1 lt 1 lw 2 lc rgb '#E6F598'
set style line 6 pt 6 ps 1 lt 1 lw 2 lc rgb '#ABDDA4'
set style line 7 pt 7 ps 1 lt 1 lw 2 lc rgb '#66C2A5'
set style line 8 pt 8 ps 1 lt 1 lw 2 lc rgb '#3288BD'

set style fill solid 0.95 border rgb 'grey30'

set key right top
set tics nomirror

set xlabel 'Wymiar danych.'
set ylabel 'GB/s'

colStep = 0.3
bs = 2 * colStep    # box width
nCol = 8
groupStep = (nCol+1) * bs
nGroups = 6
offset = 9 * colStep
xEnd = offset + (nGroups-1) * groupStep + 9 * colStep + 4

set xrange [0:xEnd]
set xtics nomirror out ('2D' offset,'3D' offset + groupStep, '4D' offset + 2*groupStep, '5D' offset + 3*groupStep, '6D' offset + 4*groupStep)

dataFile = '/home/arogowie/repos/rd/ridge_detection/tests/test_spatial_histogram/gnuplot_data/f_GeForce GTX TITAN_graphData_v3.dat'

plot dataFile i 0 u (offset + $0 * groupStep - 3 * colStep):2:(bs) t 'ROW (CUB)' w boxes ls 1, \
    ''        i 1 u (offset + $0 * groupStep - 1 * colStep):2:(bs) t 'COL (CUB)' w boxes ls 2, \
    ''        i 2 u (offset + $0 * groupStep + 1 * colStep):2:(bs) t 'ROW (trove)' w boxes ls 3, \
    ''        i 3 u (offset + $0 * groupStep + 3 * colStep):2:(bs) t 'COL (trove)' w boxes ls 4, \
    ''        i 0 u (offset + $0 * groupStep - 3 * colStep):($2 + 0.6):2 notitle w labels rotate by 70 left, \
    ''        i 1 u (offset + $0 * groupStep - 1 * colStep):($2 + 0.6):2 notitle w labels rotate by 70 left, \
    ''        i 2 u (offset + $0 * groupStep + 1 * colStep):($2 + 0.6):2 notitle w labels rotate by 70 left, \
    ''        i 3 u (offset + $0 * groupStep + 3 * colStep):($2 + 0.6):2 notitle w labels rotate by 70 left

