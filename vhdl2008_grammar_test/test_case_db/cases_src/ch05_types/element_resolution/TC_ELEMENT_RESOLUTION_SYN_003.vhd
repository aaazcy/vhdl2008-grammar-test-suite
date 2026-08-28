-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution
--              | record_resolution
-- Case Type: Positive
-- Test Focus: Both array_element_resolution and record_resolution
--            in the same architecture. A crossbar switch uses
--            resolved array lines for data and resolved record
--            fields for arbitration flags.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity crossbar_switch_2x2 is
  port (
    in0   : in  bit;
    in1   : in  bit;
    sel   : in  bit_vector(1 downto 0);
    out0  : out bit;
    out1  : out bit
  );
end entity crossbar_switch_2x2;

architecture rtl of crossbar_switch_2x2 is
  function resolve_or_bit (vs : bit_vector) return bit is
    variable r : bit := '0';
  begin
    for i in vs'range loop r := r or vs(i); end loop;
    return r;
  end function;
  subtype resolved_bit is resolve_or_bit bit;
  -- element_resolution: array_element_resolution
  type xbar_line is array (0 to 1) of resolved_bit;
  signal data_lines : xbar_line;
  -- element_resolution: record_resolution
  type arb_record is record
    grant : resolved_bit;
  end record;
  signal arb : arb_record;
begin
  data_lines(0) <= in0 when sel(0) = '1' else '0';
  data_lines(0) <= in1 when sel(1) = '1' else '0';
  out0 <= data_lines(0);
  arb.grant <= sel(0);
  arb.grant <= sel(1);
  out1 <= arb.grant;
end architecture rtl;
