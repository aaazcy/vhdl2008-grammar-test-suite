-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Negative
-- Test Focus: SNN: matching operator ?= used on integer type——the ?= matching operator may only be used for matching comparisons on types that can contain don't-care values (-) such as std_logic; using ?= on an ordinary integer type is illegal
-- Expected Result: Triggers semantic error: matching operator ?= not defined for integer type
-- Dependencies: None
-- =============================================================
entity ent_match_bad_type is
  port (
    a_i : in  integer;
    b_i : in  integer;
    y_o : out bit
  );
end entity ent_match_bad_type;

architecture rtl of ent_match_bad_type is
begin
  -- ERROR: matching relational operator ?= not applicable to integer type
  y_o <= '1' when a_i ?= b_i else '0';
end architecture rtl;
