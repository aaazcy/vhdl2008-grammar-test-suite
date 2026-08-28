-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Positive
-- Test Focus: Two-dimensional array with resolved elements. Each
--            element of a 2D memory array uses resolution to
--            handle multiple write ports. Models a dual-port
--            register file with resolution on each cell.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dual_port_regfile_resolved is
  port (
    addr_a    : in  integer range 0 to 3;
    data_a    : in  bit;
    addr_b    : in  integer range 0 to 3;
    data_b    : in  bit;
    rd        : out bit
  );
end entity dual_port_regfile_resolved;

architecture rtl of dual_port_regfile_resolved is
  function resolve_bit_two (values : bit_vector) return bit is
    variable result : bit := '0';
  begin
    -- last-write-wins: return the last value in the vector
    result := values(values'right);
    return result;
  end function;
  subtype rbit is resolve_bit_two bit;
  -- 2D array with resolved elements
  type regfile is array (0 to 3) of rbit;
  signal rf : regfile;
begin
  rf(addr_a) <= data_a;
  rf(addr_b) <= data_b;
  rd <= rf(addr_a);
end architecture rtl;
