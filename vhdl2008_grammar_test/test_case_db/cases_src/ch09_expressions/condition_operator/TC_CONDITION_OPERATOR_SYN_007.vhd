-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Positive
-- Test Focus: ?? applied to the boolean type (identity conversion) — applying ?? to a value that is already boolean does not change the semantics, verifying the identity of condition_operator on the boolean type (compatible use)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_co_boolean is
  port (
    flag_i : in  boolean;
    val_i  : in  integer;
    y_o    : out integer
  );
end entity ent_co_boolean;

architecture rtl of ent_co_boolean is
  function "??" (l : boolean) return boolean is
  begin
    return l;
  end function "??";
begin
  y_o <= val_i when ?? flag_i else 0;
end architecture rtl;
