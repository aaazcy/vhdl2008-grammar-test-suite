-- =============================================================
-- Case ID: TC_SEM_TYPE_014_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_014
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Rule Description: Full type declaration corresponding to an incomplete type must be in the same declarative region
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: missing required body
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity sem_type_014_smn2 is port(r:out integer); end entity;
architecture bh of sem_type_014_smn2 is
  function f_no_body(x:integer) return integer;  -- declared but no body
begin
  -- ERROR: function f_no_body has no body in this scope
  r <= f_no_body(5);
end architecture bh;