-- =============================================================
-- Case ID: TC_SEM_INTERFACE_ELEMENT_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_INTERFACE_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_element ::= interface_declaration
-- Case Type: Negative (Semantic)
-- Test Focus: SEMANTIC ERROR — an interface_element in the generic clause
--   (constant "CTRL_MODE") shares its identifier with a corresponding
--   signal port in the port clause. Each interface_element is individually
--   valid syntax, but the name clash across generic and port interface
--   lists violates identifier uniqueness within the entity interface.
-- Expected Result: Triggers semantic error (duplicate identifier)
-- Dependencies: None
-- =============================================================
entity iface_elem_name_clash_e is
  generic (
    constant CTRL_MODE : integer := 0
  );
  port (
    -- ERROR: "CTRL_MODE" already declared as a generic; duplicate identifier
    signal CTRL_MODE : in bit
  );
end entity iface_elem_name_clash_e;

architecture rtl of iface_elem_name_clash_e is
begin
end architecture rtl;
