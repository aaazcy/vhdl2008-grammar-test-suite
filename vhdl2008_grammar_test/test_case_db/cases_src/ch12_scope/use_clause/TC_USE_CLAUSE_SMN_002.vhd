-- =============================================================
-- Case ID: TC_USE_CLAUSE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_USE_CONFLICTING
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Negative
-- Rule Description: A name imported by a use_clause may conflict with an existing declaration or be overridden by hiding rules
-- Error Category: Name conflict — multiple use_clauses importing same-named declarations
-- Test Focus: SMN duplicate import of same-named items: use work.pkg_a.my_type; use work.pkg_b.my_type — two different packages define a type with the same name my_type, and importing it through two use_clauses causes a name-conflict ambiguity
-- Expected Result: Triggers semantic error: ambiguous reference to "my_type"
-- Dependencies: None
-- =============================================================
package pkg_a is
  subtype my_type is integer range 0 to 15;
end package pkg_a;

package pkg_b is
  subtype my_type is integer range 0 to 255;
end package pkg_b;

entity uc_conflict is
  port (
    val : in  integer;
    res : out integer
  );
end entity uc_conflict;

architecture rtl of uc_conflict is
  use work.pkg_a.my_type;
  -- ERROR: my_type imported from both pkg_a and pkg_b causes ambiguity
  use work.pkg_b.my_type;
  signal s : my_type;
begin
  s <= val;
  res <= s;
end architecture rtl;
