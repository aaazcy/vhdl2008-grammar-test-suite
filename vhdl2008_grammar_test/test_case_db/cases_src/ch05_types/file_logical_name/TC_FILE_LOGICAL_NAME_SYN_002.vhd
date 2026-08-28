-- =============================================================
-- Case ID: TC_FILE_LOGICAL_NAME_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: file_logical_name ::= string_expression
-- Case Type: Positive
-- Test Focus: Concatenated string expression as file_logical_name — two string
--   literals joined with & operator to form path+filename
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_log_name_syn2 is
  port(
    stamp : out integer
  );
end entity;

architecture rtl of file_log_name_syn2 is
  type t_intfile is file of integer;
  file fh : t_intfile;
  signal s_result : integer := 0;
begin
  process
    variable v : integer;
    constant c_path : string := "logs/";
  begin
    file_open(fh, c_path & "samples.dat", READ_MODE);
    if not endfile(fh) then
      read(fh, v);
    end if;
    file_close(fh);
    s_result <= 1;
    wait;
  end process;
  stamp <= s_result;
end architecture;
