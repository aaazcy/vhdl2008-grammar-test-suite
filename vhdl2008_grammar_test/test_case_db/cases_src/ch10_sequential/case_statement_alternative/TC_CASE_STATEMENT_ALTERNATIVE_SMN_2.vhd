-- =============================================================
-- Case ID: TC_CASE_STATEMENT_ALTERNATIVE_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_009
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement_alternative ::= when choices => sequence_of_statements
-- Case Type: Negative
-- Test Focus: SEM: choice value type mismatch with the case expression type - integer type case expression but the choice uses enumeration literal RED
-- Expected Result: Triggers semantic error: choice value type does not match case expression type
-- Dependencies: None
-- =============================================================
entity csa_sem1_ent is port(sel:in integer range 0 to 2; y:out integer); end entity;
architecture bh of csa_sem1_ent is
  type t_color is (RED, GREEN, BLUE);
begin
  process(sel) begin
    case sel is
      when RED   => y <= 1;
      when GREEN => y <= 2;
      when others => y <= 0;
    end case;
  end process;
end architecture bh;
