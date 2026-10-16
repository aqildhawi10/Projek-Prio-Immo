program SmartGrad;
uses crt;

var
    nama, status, mhsMax, mhsMin : string;
    nim, cariNim : string;
    arrNim, arrNama, arrStatus : array[1..100] of string;
    arrAkhir : array[1..100] of real;
    arrHuruf : array[1..100] of char;

    tugas, uts, uas, akhir, maxNilai, minNilai : real;
    pilihan, j, i, k, totalMhs : integer;
    huruf : char;
    ketemu : boolean;

begin
    totalMhs := 0;
    maxNilai := -1;
    minNilai := 101;

    repeat
        clrscr;
        writeln('===============================================');
        writeln('          SMART-GRAD: MANAJEMEN NILAI          ');
        writeln('===============================================');
        writeln('1. Input Nilai Mahasiswa');
        writeln('2. Tampilkan Rekap Nilai');
        writeln('3. Statistik Nilai (Tertinggi & Terendah)');
        writeln('4. Cari Data Mahasiswa (While & Break)');
        writeln('5. Keluar');
        writeln('===============================================');
        write('Pilih menu (1-5): ');
        readln(pilihan);

        case pilihan of
            1: begin
                clrscr;
                write('Masukkan jumlah mahasiswa: ');
                readln(j);

                for i := 1 to j do
                begin
                    writeln;
                    writeln('Data Mahasiswa Ke-', i);
                    write('NIM  : ');
                    readln(nim);
                    write('Nama : ');
                    readln(nama);
                    write('Nilai Tugas : '); 
                    readln(tugas);
                    write('Nilai UTS : '); 
                    readln(uts);
                    write('Nilai UAS : '); 
                    readln(uas);

                    if (tugas < 0) or (tugas > 100) or (uts < 0) or (uts > 100) or (uas < 0) or (uas > 100) then
                    begin
                        writeln('Nilai tidak valid! Data dilewati.');
                        readln;
                        continue;
                    end;

                    totalMhs := totalMhs + 1;
                    akhir := (0.2 * tugas) + (0.3 * uts) + (0.5 * uas);

                    if akhir >= 85 then
                        huruf := 'A'
                    else if akhir >= 70 then
                        huruf := 'B'
                    else if akhir >= 55 then
                        huruf := 'C'
                    else if akhir >= 40 then
                        huruf := 'D'
                    else
                        huruf := 'E';

                    if (huruf = 'D') or (huruf = 'E') then
                        status := 'TIDAK LULUS'
                    else
                        status := 'LULUS';

                    arrNim[totalMhs] := nim;
                    arrNama[totalMhs] := nama;
                    arrAkhir[totalMhs] := akhir;
                    arrHuruf[totalMhs] := huruf;
                    arrStatus[totalMhs] := status;

                    if akhir > maxNilai then
                    begin
                        maxNilai := akhir;
                        mhsMax := nama;
                    end;

                    if akhir < minNilai then
                    begin
                        minNilai := akhir;
                        mhsMin := nama;
                    end;
                end;

                writeln;
                writeln('Data berhasil disimpan!');
                readln;
            end;

            2: begin
                clrscr;
                writeln('=================================================================');
                writeln('NIM                 Nama              Akhir  Huruf   Status');
                writeln('=================================================================');

                if totalMhs = 0 then
                    writeln(' Belum ada data.')
                else
                begin
                    for i := 1 to totalMhs do
                    begin
                        write(arrNim[i]);
                        for k := length(arrNim[i]) + 1 to 20 do
                            write(' ');

                        write(arrNama[i]);
                        for k := length(arrNama[i]) + 1 to 16 do
                            write(' ');

                        writeln(arrAkhir[i]:7:1, arrHuruf[i]:6, '   ', arrStatus[i]);
                    end;
                end;

                writeln('=================================================================');
                readln;
            end;

            3: begin
                clrscr;
                writeln('=== STATISTIK NILAI ===');

                if totalMhs = 0 then
                    writeln('Belum ada data.')
                else
                begin
                    writeln('Nilai Tertinggi : ', maxNilai:0:2, ' (', mhsMax, ')');
                    writeln('Nilai Terendah  : ', minNilai:0:2, ' (', mhsMin, ')');
                end;

                readln;
            end;

            4: begin
                clrscr;
                write('Masukkan NIM yang dicari: ');
                readln(cariNim);
                i := 1;
                ketemu := false;

                while i <= totalMhs do
                begin
                    if arrNim[i] = cariNim then
                    begin
                        ketemu := true;
                        writeln;
                        writeln('--- DATA DITEMUKAN ---');
                        writeln('Nama   : ', arrNama[i]);
                        writeln('Nilai  : ', arrAkhir[i]:0:2, ' (', arrHuruf[i], ')');
                        writeln('Status : ', arrStatus[i]);
                        break;
                    end;
                    i := i + 1;
                end;

                if not ketemu then
                    writeln('Data tidak ditemukan.');

                readln;
            end;

            5: writeln('Terima kasih!');
        else
            begin
                writeln('Pilihan salah!');
                readln;
            end;
        end;
    until pilihan = 5;
end.