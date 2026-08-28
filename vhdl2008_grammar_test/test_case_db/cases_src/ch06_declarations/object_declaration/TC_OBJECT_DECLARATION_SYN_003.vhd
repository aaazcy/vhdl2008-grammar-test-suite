-- =============================================================
-- Case ID: TC_OBJECT_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2
-- Production: object_declaration ::= constant_declaration | signal_declaration | variable_declaration | file_declaration
-- Case Type: Positive
-- Test Focus: Exercises object_declaration with file_declaration alternative for testbench log file output.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity object_decl_syn3 is
  port (
    clk     : in  bit;
    trigger : in  bit;
    data    : in  bit_vector(7 downto 0);
    logged  : out bit
  );
end entity object_decl_syn3;

architecture rtl of object_decl_syn3 is
  type t_log_file is file of character;
  file f_log : t_log_file open write_mode is "output.log";
  signal s_logged : bit := '0';
begin
  process(clk)
    variable v_logged : boolean := false;
  begin
    if clk'event and clk = '1' then
      if trigger = '1' and not v_logged then
        s_logged <= '1';
        v_logged := true;
      end if;
    end if;
  end process;
  logged <= s_logged;
end architecture rtl;
