-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement_alternative ::= when choices => sequence_of_statements
-- Case Type: Positive
-- Test Focus: when others => as the last alternative: when others=>null - covers all unmatched values, body is a null statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csa_syn4_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of csa_syn4_ent is
begin
  process(sel) begin
    y <= 0;
    case sel is
      when 0 => y <= 10;
      when 1 => y <= 20;
      when others => null;
    end case;
  end process;
end architecture bh;
