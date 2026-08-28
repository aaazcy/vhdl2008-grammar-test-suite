-- =============================================================
-- Case ID: TC_LABEL_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_LABEL_SCOPE
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: label ::= identifier
-- Case Type: Negative
-- Test Focus: SEM: label conflicts with signal name in same declarative region
-- Expected Result: Triggers semantic error: label conflicts with existing declaration
-- Dependencies: None
-- =============================================================
entity label_sem2_ent is port(y:out integer); end entity;
architecture bh of label_sem2_ent is
  signal my_label:integer:=0;
begin
  process is begin
    my_label: for i in 0 to 3 loop my_label<=i; end loop;
    y<=my_label; wait;
  end process;
end architecture bh;
