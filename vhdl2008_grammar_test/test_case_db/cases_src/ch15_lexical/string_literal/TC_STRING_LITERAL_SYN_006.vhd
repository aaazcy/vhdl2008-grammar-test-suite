-- =============================================================
-- Case ID: TC_STRING_LITERAL_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Positive
-- Test Focus: String used in a report statement — string_literal as message output in assertions, test the use of strings in runtime contexts
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity str_in_report is
  port (
    trigger : in  bit;
    msg_out : out string(1 to 10)
  );
end entity str_in_report;

architecture rtl of str_in_report is
  constant C_OK  : string(1 to 10) := "TEST PASS ";
  constant C_ERR : string(1 to 10) := "TEST FAIL ";
begin
  process(trigger)
  begin
    if trigger = '1' then
      report "Simulation checkpoint reached" severity note;
      msg_out <= C_OK;
    else
      msg_out <= C_ERR;
    end if;
  end process;
end architecture rtl;
