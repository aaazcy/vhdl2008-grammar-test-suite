-- =============================================================
-- Case ID: TC_SEM_PKG_003_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_PKG_003
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Rule Description: Items declared in package body must have been declared in the package declaration
-- Case Type: Negative
-- Error Category: scope_visibility_error
-- Test Focus: SEM: function declared in package body has no corresponding declaration in package declaration - function f_orphan appears only in body and is missing from declaration
-- Expected Result: Triggers semantic error: scope_visibility_error
-- Dependencies: None
-- =============================================================
package pkg_sem_body is
  function f_declared return integer;
end package pkg_sem_body;
package body pkg_sem_body is
  function f_declared return integer is begin return 0; end function;
  -- ERROR: function not declared in package_declaration
  function f_orphan return integer is begin return 1; end function;
end package body pkg_sem_body;
entity pbdi_sem_ent is port(r:out integer); end entity;
architecture bh of pbdi_sem_ent is begin r<=pkg_sem_body.f_declared; end architecture bh;
