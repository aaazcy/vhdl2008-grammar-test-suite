-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_QUALIFIED_EXPRESSION_TYPE_VISIBLE
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Rule Description: The type_mark in a qualified expression must denote a visible type or subtype.
-- Test Focus: SEM: type_mark must be a visible type — predefined types such as integer, real, bit_vector serve as type_mark, verifying the legality of visible type marks
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_qe_sem_001 is
  port (
    a, b : in  integer;
    y    : out real
  );
end entity ent_qe_sem_001;

architecture visible_type of ent_qe_sem_001 is
  type t_my_real is range -100 to 100;
  signal s_i : integer;
  signal s_r : t_my_real;
begin
  s_i <= integer'(a + b);
  s_r <= t_my_real'(50);
  y <= real(s_r);
end architecture visible_type;
