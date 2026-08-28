-- =============================================================
-- Case ID: TC_CASE_GENERATE_ALTERNATIVE_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_CGA_DUPLICATE
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Rule Description: Case generate alternatives must not have overlapping choices
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SEM: duplicate choice coverage in case generate alternatives
-- Expected Result: Triggers semantic error: duplicate generate choice
-- Dependencies: None
-- =============================================================
entity cga_sem1_ent is port(y:out integer); end entity;
architecture bh of cga_sem1_ent is
  constant C_SEL:integer:=0;
begin
  g1: case C_SEL generate
    when 0 => y<=10;
    when 0 to 2 => y<=20;
    when others => y<=30;
  end generate;
end architecture bh;
