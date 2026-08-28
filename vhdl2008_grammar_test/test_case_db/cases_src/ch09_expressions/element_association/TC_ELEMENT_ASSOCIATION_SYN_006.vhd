-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: pipe-separated choices: 0｜2｜4｜6 => 0 — multiple indices joined with pipes as the choices, corresponding to the same expression value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ea_pipe_choices is
  port (
    x : out integer
  );
end entity ea_pipe_choices;

architecture pipe_sel of ea_pipe_choices is
  type t_regfile is array(0 to 7) of integer;
  signal s_rf : t_regfile;
begin
  -- even indices set to 0, odd indices set to 1, using pipe-separated choices
  s_rf <= (0|2|4|6 => 0, 1|3|5|7 => 1);
  x <= s_rf(0) + s_rf(1) + s_rf(3);
end architecture pipe_sel;
