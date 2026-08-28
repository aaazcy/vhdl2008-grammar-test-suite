-- =============================================================
-- Case ID: TC_FILE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: file_declaration ::=
--   file identifier_list : subtype_indication
--   [ file_open_information ] ;
-- Test Focus: File declarations with multiple identifiers
--   sharing a subtype, and file_open_information using
--   all three open_kind values (read_mode, write_mode,
--   append_mode) across different file objects —
--   exercises the identifier_list comma form and the
--   full file_open_information grammar
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.numeric_bit.all;
entity file_declaration_syn_003 is
  port (
    clk       : in  bit;
    rst_n     : in  bit;
    data_out  : out bit_vector(7 downto 0);
    valid_out : out bit
  );
end entity file_declaration_syn_003;

architecture rtl of file_declaration_syn_003 is
  -- File types
  type t_byte_file is file of character;
  type t_str_file  is file of string;

  -- file_declaration: multi-identifier, read_mode
  file f_in_a, f_in_b, f_in_c : t_byte_file open read_mode is "input.dat";

  -- file_declaration: single identifier, write_mode
  file f_result : t_byte_file open write_mode is "result.dat";

  -- file_declaration: single identifier, append_mode
  file f_trace : t_str_file open append_mode is "trace.log";

  -- file_declaration: no open information (lazy open)
  file f_backup : t_byte_file;

  signal s_data  : bit_vector(7 downto 0) := (others => '0');
  signal s_valid : bit := '0';
  signal s_count : integer range 0 to 7 := 0;
begin
  -- File reading process
  process(clk, rst_n)
    variable v_char : character;
  begin
    if rst_n = '0' then
      s_data  <= (others => '0');
      s_valid <= '0';
      s_count <= 0;
    elsif clk'event and clk = '1' then
      if not endfile(f_in_a) then
        read(f_in_a, v_char);
        s_data <= bit_vector(to_unsigned(character'pos(v_char), 8));
        s_valid <= '1';
      else
        s_valid <= '0';
      end if;
    end if;
  end process;

  data_out  <= s_data;
  valid_out <= s_valid;
end architecture rtl;
