-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ASP_002
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Rule Description: Concurrent statement labels in the architecture statement part must be unique (duplicate label conflict)
-- Case Type: Negative
-- Error Category: duplicate_concurrent_label
-- Test Focus: Negative case: two concurrent signal assignment statements in the statement part reuse the same label drv (drv: y<=a and b; and drv: y<=a or b;), verifying the analyzer performs uniqueness checking on concurrent statement labels and rejects the duplicate label
-- Expected Result: Triggers semantic error: label drv already used for a declaration
-- Dependencies: None
-- =============================================================
entity asp_smn_ent is port(a,b:in bit; y:out bit); end entity;
architecture bh of asp_smn_ent is
begin
  drv : y <= a and b;
  drv : y <= a or b;
end architecture bh;
