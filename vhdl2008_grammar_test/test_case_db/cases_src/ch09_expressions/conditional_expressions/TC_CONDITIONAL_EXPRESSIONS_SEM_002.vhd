-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONDITIONAL_EXPRESSIONS_BOOL_COND_OK
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Rule Description: Each condition in a conditional expression must evaluate to boolean
-- Test Focus: All conditions are legal boolean expressions: y <= a when x>0 else b when x=0 else c; all three conditions are relational comparisons returning boolean
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ce_sem_bool_ok is
  port (
    x       : in  integer;
    a, b, c : in  bit_vector(3 downto 0);
    y       : out bit_vector(3 downto 0)
  );
end entity ce_sem_bool_ok;

architecture bool_conds of ce_sem_bool_ok is
begin
  y <= a when x > 0 else
       b when x = 0 else
       c;
end architecture bool_conds;
