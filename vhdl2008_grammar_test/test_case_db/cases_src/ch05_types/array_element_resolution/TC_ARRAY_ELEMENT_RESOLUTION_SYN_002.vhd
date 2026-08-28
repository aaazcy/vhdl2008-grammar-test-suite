-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Positive
-- Test Focus: Resolution function for integer array elements using
--            a majority-vote resolution. A triple-redundant sensor
--            array where each element is majority-resolved across
--            three independent readings.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity triple_redundant_sensor is
  port (
    sensor_a : in  integer range 0 to 1023;
    sensor_b : in  integer range 0 to 1023;
    sensor_c : in  integer range 0 to 1023;
    reliable : out integer range 0 to 1023
  );
end entity triple_redundant_sensor;

architecture rtl of triple_redundant_sensor is
  function majority_vote (vals : integer_vector) return integer is
    variable a, b, c : integer;
  begin
    a := vals(vals'left);
    b := vals(vals'left + 1);
    c := vals(vals'left + 2);
    if a = b or a = c then return a;
    elsif b = c then return b;
    else return a;
    end if;
  end function;
  -- array_element_resolution: resolution_indication resolves each element
  subtype resolved_int is majority_vote integer;
  type sensor_array is array (0 to 0) of resolved_int;
  signal fused : sensor_array;
begin
  fused(0) <= sensor_a;
  fused(0) <= sensor_b;
  fused(0) <= sensor_c;
  reliable <= fused(0);
end architecture rtl;
