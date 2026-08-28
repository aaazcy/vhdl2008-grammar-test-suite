-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case expression is case_statement_alternative { case_statement_alternative } end case [ case_label ] ;
-- Case Type: Positive
-- Test Focus: VHDL 2008 matching case?: uses the `case?` syntax (matching case), expression is bit_vector(3..0), choices use bit string literals containing `-` (don't care) for pattern matching, verifying the case? keyword and don't-care matching of the VHDL 2008 matching case statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee; use ieee.std_logic_1164.all;
entity case_match_ent is
  port(sel:in std_logic_vector(3 downto 0); y:out integer);
end entity;
architecture bh of case_match_ent is
begin
  process(sel) is
  begin
    case? sel is
      when "000-" => y<= 0;
      when "001-" => y<= 10;
      when "01--" => y<= 20;
      when "1---" => y<= 30;
      when others => y<= 99;
    end case?;
  end process;
end architecture bh;
