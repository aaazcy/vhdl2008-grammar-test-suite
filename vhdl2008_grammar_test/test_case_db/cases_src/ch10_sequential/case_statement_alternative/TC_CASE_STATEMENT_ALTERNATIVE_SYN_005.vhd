-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement_alternative ::= when choices => sequence_of_statements
-- Case Type: Positive
-- Test Focus: Multi-statement alternative: when 0 => seq_of_statements contains two variable assignments + one signal assignment - verifying the alternative body holds multiple sequential statements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csa_syn5_ent is port(sel:in integer range 0 to 1; a,b:in integer; y:out integer); end entity;
architecture bh of csa_syn5_ent is
begin
  process(sel,a,b) is
    variable v_sum, v_diff : integer;
  begin
    case sel is
      when 0 =>
        v_sum := a + b;
        v_diff := a - b;
        y <= v_sum + v_diff;
      when others =>
        y <= 0;
    end case;
  end process;
end architecture bh;
