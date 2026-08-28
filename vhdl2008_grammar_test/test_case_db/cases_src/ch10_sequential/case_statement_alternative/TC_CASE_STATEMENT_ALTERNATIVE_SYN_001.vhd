-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement_alternative ::= when choices => sequence_of_statements
-- Case Type: Positive
-- Test Focus: Minimal when choices=> with a single choice: when 0 => y<=a - single choice + single signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csa_syn1_ent is port(sel:in integer range 0 to 1; a:in integer; y:out integer); end entity;
architecture bh of csa_syn1_ent is
begin
  process(sel,a) begin
    case sel is
      when 0 => y <= a;
      when others => y <= 0;
    end case;
  end process;
end architecture bh;
