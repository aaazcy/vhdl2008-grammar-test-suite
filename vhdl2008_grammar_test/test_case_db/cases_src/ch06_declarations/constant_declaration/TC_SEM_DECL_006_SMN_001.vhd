-- =============================================================
-- Case ID: TC_SEM_DECL_006_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_DECL_006
-- Standard Reference: IEEE 1076-2008 Section 6.4
-- Rule Description: A deferred constant declaration must have a corresponding full constant declaration in the package body
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Deferred constant C_DEFERRED is declared in package p_def, but the package body p_def provides no full constant declaration for it
-- Expected Result: Triggers semantic error: missing value for constant declared at line 2
-- Dependencies: None
-- =============================================================
package p_def is
  constant C_DEFERRED : integer;
end package p_def;
package body p_def is
end package body p_def;
