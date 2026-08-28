-- =============================================================
-- Case ID: TC_AGGREGATE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_AGGREGATE_EMPTY
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Negative
-- Rule Description: An aggregate must contain at least one element_association (except when used as a qualified expression for certain types). An empty aggregate "()" is not valid for all type contexts.
-- Error Category: Invalid aggregate
-- Test Focus: SMN: empty aggregate "()" used in a context without a determinable type — the empty aggregate cannot determine the target type and contains no element associations, so the target composite type cannot be resolved without a type mark qualification
-- Expected Result: Triggers semantic error: empty aggregate cannot determine target type
-- Dependencies: None
-- =============================================================
entity ent_smn_empty is
  port (
    y_o : out bit_vector(3 downto 0)
  );
end entity ent_smn_empty;

architecture rtl of ent_smn_empty is
begin
  -- ERROR: empty aggregate without type context
  y_o <= ();
end architecture rtl;
