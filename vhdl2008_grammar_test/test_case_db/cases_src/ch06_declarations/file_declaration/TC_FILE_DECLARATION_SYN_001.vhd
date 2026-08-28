-- =============================================================
-- Case ID: TC_FILE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- BNF Production: FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: file_declaration ::=
--   file identifier_list : subtype_indication
--   [ file_open_information ] ;
-- Test Focus: File declarations with and without
--   file_open_information — defines file types for
--   character and integer, declares file objects with
--   various open modes, and reads from a file in a
--   process. Exercises the full production including
--   the optional open information clause.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_declaration_syn_001 is
  port (
    clk      : in  bit;
    rst_n    : in  bit;
    char_out : out integer range 0 to 255
  );
end entity file_declaration_syn_001;

architecture rtl of file_declaration_syn_001 is
  -- File type definition
  type t_char_file is file of character;
  type t_int_file  is file of integer;

  -- file_declaration without open information
  file f_input : t_char_file;

  -- file_declaration with file_open_information
  file f_output  : t_char_file open write_mode is "output.txt";
  file f_log     : t_int_file  open append_mode is "log.txt";

  -- file_declaration with multi-identifier list and read_mode
  file f_ref_a, f_ref_b : t_char_file open read_mode is "refdata.txt";

  signal s_char_val : integer range 0 to 255 := 0;
  signal s_count    : integer range 0 to 15 := 0;
begin
  -- Stimulus file reader process
  process(clk, rst_n)
    variable v_char : character;
  begin
    if rst_n = '0' then
      s_char_val <= 0;
      s_count    <= 0;
    elsif clk'event and clk = '1' then
      if not endfile(f_input) and s_count < 15 then
        read(f_input, v_char);
        s_char_val <= character'pos(v_char);
        s_count    <= s_count + 1;
      end if;
    end if;
  end process;

  char_out <= s_char_val;
end architecture rtl;
