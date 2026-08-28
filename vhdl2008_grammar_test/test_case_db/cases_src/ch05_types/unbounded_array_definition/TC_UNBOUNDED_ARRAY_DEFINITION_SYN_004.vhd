-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::=
--   array ( index_subtype_definition { , index_subtype_definition } )
--   of element_subtype_indication
-- Case Type: Positive
-- Test Focus: Unbounded array where element_subtype_indication
--            is a record type. A PCIe configuration space with
--            variable number of capability structures.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pcie_capability_list is
  port (
    cap_idx  : in  integer range 0 to 3;
    cap_id   : out integer range 0 to 255;
    next_ptr : out integer range 0 to 255
  );
end entity pcie_capability_list;

architecture rtl of pcie_capability_list is
  type pcie_cap is record
    capability_id  : integer range 0 to 255;
    next_cap_ptr   : integer range 0 to 255;
    enabled        : bit;
  end record;
  -- unbounded_array_definition: element is record type
  type cap_array is array (integer range <>) of pcie_cap;
  subtype cap_list is cap_array(0 to 3);
  signal caps : cap_list := (
    0 => (capability_id => 1, next_cap_ptr => 2, enabled => '1'),
    1 => (capability_id => 5, next_cap_ptr => 3, enabled => '1'),
    2 => (capability_id => 16#10#, next_cap_ptr => 0, enabled => '0'),
    3 => (capability_id => 16#11#, next_cap_ptr => 0, enabled => '1')
  );
begin
  cap_id   <= caps(cap_idx).capability_id;
  next_ptr <= caps(cap_idx).next_cap_ptr;
end architecture rtl;
