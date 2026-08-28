-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution
--              | record_resolution
-- Case Type: Positive
-- Test Focus: element_resolution with array_element_resolution
--            for a 2D memory array where each cell has resolution.
--            Models a multi-ported SRAM with write conflict
--            resolution at each bit cell.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dual_port_sram_cell is
  port (
    we_a  : in  bit;
    d_a   : in  bit;
    we_b  : in  bit;
    d_b   : in  bit;
    q     : out bit
  );
end entity dual_port_sram_cell;

architecture rtl of dual_port_sram_cell is
  function cell_resolve (vs : bit_vector) return bit is
    variable r : bit := '0';
  begin
    r := vs(vs'right);
    return r;
  end function;
  subtype cell_bit is cell_resolve bit;
  type ram_row is array (0 to 7) of cell_bit;
  signal row : ram_row;
begin
  row(0) <= d_a when we_a = '1' else '0';
  row(0) <= d_b when we_b = '1' else '0';
  q <= row(0);
end architecture rtl;
