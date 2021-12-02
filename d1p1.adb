with Ada.Text_IO;
use Ada.Text_IO;

procedure d1p1 is
    F         : File_Type;
    File_Name : constant String := "d1p1input.txt";
    a, b      : Integer;
    c         : Integer := 0;
begin
    Open (F, In_File, File_Name);
    a := Integer'Value(Get_Line(F));
    while not End_Of_File (F) loop
        b := Integer'Value(Get_Line(F));
        Put_Line("a: " & Integer'Image(a) & "  b: " & Integer'Image(b));
        if b>a then
            c := c + 1;
        end if;
        a := b;
    end loop;
    Close (F);
    Put_Line(Integer'Image(c));

end d1p1;
