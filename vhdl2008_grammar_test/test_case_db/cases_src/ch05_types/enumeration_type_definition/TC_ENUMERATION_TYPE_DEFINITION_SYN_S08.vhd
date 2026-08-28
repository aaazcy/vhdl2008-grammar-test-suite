-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SYN_S08
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Positive
-- Test Focus: Enumeration type declared in a package used as a generic constant type across entity/package boundaries -- the enumeration_type_definition appears in a package declaration and its type is consumed through a generic constant, validating that the comma-separated list of literals produces a type visible across design-unit boundaries via use clauses
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package enum_pkg is
  type t_prio is (LOW, MEDIUM, HIGH, CRITICAL);
  constant C_DEFAULT_PRIO : t_prio := MEDIUM;
end package;

use work.enum_pkg.all;

entity enum_generic_ent is
  generic(
    G_DEFAULT : t_prio := C_DEFAULT_PRIO
  );
  port(
    req_prio : in  t_prio;
    granted  : out bit
  );
end entity;

architecture rtl of enum_generic_ent is
  signal threshold : t_prio := G_DEFAULT;
begin
  process(req_prio)
  begin
    if t_prio'pos(req_prio) >= t_prio'pos(threshold) then
      granted <= '1';
    else
      granted <= '0';
    end if;
  end process;
end architecture rtl;
