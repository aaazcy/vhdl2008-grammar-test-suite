-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Positive
-- Test Focus: The addition operator + in integer arithmetic within a process - two integer ports are added and assigned to an output port, verifying the basic use of + as an adding_operator in the term { adding_operator term } chain of simple_expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_add_int is
  port (
    a_i : in  integer range 0 to 255;
    b_i : in  integer range 0 to 255;
    y_o : out integer range 0 to 510
  );
end entity ent_add_int;

architecture rtl of ent_add_int is
begin
  y_o <= a_i + b_i;
end architecture rtl;
