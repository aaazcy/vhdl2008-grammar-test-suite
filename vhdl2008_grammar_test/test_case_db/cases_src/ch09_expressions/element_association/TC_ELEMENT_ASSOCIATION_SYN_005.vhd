-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Test Focus: others choice as the choices: others => 0 — in an array aggregate the values of all remaining unnamed positions are set to 0
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ea_others is
  port (
    base : in  integer range 0 to 3;
    v    : out integer
  );
end entity ea_others;

architecture others_choice of ea_others is
  type t_buf is array(0 to 7) of integer;
  signal s_buf : t_buf;
begin
  s_buf <= (0 => base * 2, 1 => base * 4, others => 0);
  v <= s_buf(0) + s_buf(1);
end architecture others_choice;
