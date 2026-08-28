-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT_ALTERNATIVE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement_alternative ::= when choices => sequence_of_statements
-- Case Type: Positive
-- Test Focus: when choices=> with a multi-choice list: when 0 or 1 or 2 => y<=sel*2 - three discrete values separated by `or` in the choices
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csa_syn2_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of csa_syn2_ent is
begin
  process(sel) begin
    case sel is
      when 0|1|2 => y <= sel * 2;
      when others => y <= -1;
    end case;
  end process;
end architecture bh;
