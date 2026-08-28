-- =============================================================
-- Case ID: TC_CHOICE_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_CHOICE_OVERLAP
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Rule Description: Each value in case expression type must be covered at most once
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SEM: duplicate choice value 1 appears in when 1 and when 1｜2
-- Expected Result: Triggers semantic error: duplicate choice
-- Dependencies: None
-- =============================================================
entity choice_sem1_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of choice_sem1_ent is
begin
  process(sel) begin
    case sel is when 0=>y<=0; when 1=>y<=10; when 1|2=>y<=20; when others=>y<=30; end case;
  end process;
end architecture bh;
