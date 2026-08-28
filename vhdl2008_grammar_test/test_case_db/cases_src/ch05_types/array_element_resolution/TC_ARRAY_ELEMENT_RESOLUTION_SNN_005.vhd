-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Negative
-- Test Focus: SNN: resolution_indication missing the type mark to be resolved - 'subtype bad_res is pairwise;' gives only the resolution function name without a type mark, verifying subtype_indication requires type_mark to denote a type or a subtype
-- Expected Result: Triggers syntax error: a type mark must denote a type or a subtype
-- Dependencies: None
-- =============================================================
entity aer5_ent is end entity;
architecture rtl of aer5_ent is
  function pairwise (vals : bit_vector) return bit is
  begin
    return vals(vals'left);
  end function;
  subtype bad_res is pairwise;
begin
end architecture;
