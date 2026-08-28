-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Negative
-- Test Focus: subprogram_declarative_part: use_clause referencing a non-existent package — use_clause is a valid subprogram_declarative_item, but the referenced package ghost_pkg does not exist in library work, so the declarative part cannot be resolved
-- Expected Result: Triggers semantic error: unit "ghost_pkg" not found in library "work"
-- Dependencies: None
-- =============================================================
package sdp_use_pkg is
  function f_local(a : natural) return natural;
end package sdp_use_pkg;
package body sdp_use_pkg is
  function f_local(a : natural) return natural is
    use work.ghost_pkg.all;
  begin
    return a;
  end function;
end package body sdp_use_pkg;
