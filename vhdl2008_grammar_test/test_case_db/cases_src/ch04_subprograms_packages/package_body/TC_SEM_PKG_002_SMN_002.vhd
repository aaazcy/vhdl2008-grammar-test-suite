-- =============================================================
-- Case ID: TC_SEM_PKG_002_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_PKG_002
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Rule Description: A package body defines the implementations for items declared in the package declaration; if the package body is missing required subprogram bodies that were declared in the package spec, this is a semantic error
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: subprogram declared in package has no body in package body — the package declaration promises a function, but the package body never defines it, violating the completeness requirement
-- Expected Result: Triggers semantic error: missing subprogram body for declared subprogram
-- Dependencies: None
-- =============================================================
entity sem_pkg_body_missing_impl is
  port (
    req_in  : in  integer;
    resp_out: out integer
  );
end entity;

architecture test of sem_pkg_body_missing_impl is
  -- Simulates the scenario: a function is declared (in package declaration)
  -- but the package body never provides the implementation.
  -- The forward declaration below would correspond to a package spec entry,
  -- but since no body exists here, it simulates the 'missing body' error.

  function f_required(x : integer) return integer;

  -- No matching body defined below — error: missing subprogram body

  signal s_resp : integer := 0;
begin
  -- ERROR: call to function with declaration but no body
  s_resp  <= f_required(req_in);  -- would fail at elaboration
  resp_out <= s_resp;
end architecture test;
