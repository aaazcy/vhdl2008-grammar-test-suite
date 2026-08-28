-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement_alternative ::= when choices => sequence_of_statements
-- Case Type: Negative
-- Test Focus: SNN: missing => symbol after when 0 - in when 0 y <= 1 the required => delimiter between choices and sequence_of_statements is missing
-- Expected Result: Triggers syntax error: '=>' is expected instead of ';'
-- Dependencies: None
-- =============================================================
entity csa_missing_arrow is port(sel:in integer range 0 to 1; y:out integer); end entity;
architecture vhdl2008 of csa_missing_arrow is
begin
  process(sel) begin
    case sel is
      when 0 y <= 1;
      when others => y <= 0;
    end case;
  end process;
end architecture vhdl2008;
