-- =============================================================
-- Case ID: TC_SEM_DECL_006_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_DECL_006
-- Standard Reference: IEEE 1076-2008 Section 6.4
-- Rule Description: The subtype of the full constant declaration must conform to the subtype of the deferred constant declaration
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Deferred constant C_MISMATCH is declared with subtype integer in package p_def2, but the full constant declaration in the package body uses subtype bit_vector(3 downto 0), which does not conform
-- Expected Result: Triggers semantic error: subtype indication doesn't conform with the deferred constant
-- Dependencies: None
-- =============================================================
package p_def2 is
  constant C_MISMATCH : integer;
end package p_def2;
package body p_def2 is
  constant C_MISMATCH : bit_vector(3 downto 0) := X"0";
end package body p_def2;
