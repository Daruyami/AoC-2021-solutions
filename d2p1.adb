with Ada.Strings;           use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;           use Ada.Text_IO;

procedure d2p1 is
    F : File_Type;
    File_Name : constant String := "d2p1input.txt";
    us : Unbounded_String;
    str : String := "forward 12";
    depth, x : Integer := 0;

begin
    Open (F, In_File, File_Name);
    while not End_Of_File (F) loop
        us := To_Unbounded_String(Get_Line(F));
        Put_Line(To_String(us));

        if Slice(us, 1, Index(us, " ")-1) = "forward" then
            x := x + Integer'Value(Slice(us, Index(us," ")+1, Length(us)));
        elsif Slice(us, 1, Index(us, " ")-1) = "down" then
            depth := depth + Integer'Value(Slice(us, Index(us," ")+1, Length(us)));
        elsif Slice(us, 1, Index(us, " ")-1) = "up" then
            depth := depth - Integer'Value(Slice(us, Index(us," ")+1, Length(us)));
        else
            Put_Line("Error at loop, the slice is: " & Slice(us, 1, Index(us, " ")-1));
        end if;

        Put_Line("x: " & Integer'Image(x) & "  depth: " & Integer'Image(depth));
    end loop;
    Close(F);
    Put_Line("The result is: " & Integer'Image(x*depth));
end d2p1;
