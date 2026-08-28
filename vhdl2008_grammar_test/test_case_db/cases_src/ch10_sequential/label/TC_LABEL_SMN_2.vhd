-- =============================================================
-- Case ID: TC_LABEL_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_LABEL_DUPLICATE
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Rule Description: Labels in the same declarative region must be unique
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SEM: duplicate loop labels in same process
-- Expected Result: Triggers semantic error: duplicate label
-- Dependencies: None
-- =============================================================
entity label_sem1_ent is port(y:out integer); end entity;
architecture bh of label_sem1_ent is
  signal s_a:integer:=0;
begin
  process is
  begin
    L1: for i in 0 to 3 loop s_a<=i; end loop;
    L1: for i in 0 to 3 loop s_a<=i; end loop;
    y<=s_a; wait;
  end process;
end architecture bh;
