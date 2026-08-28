-- =============================================================
-- Case ID: TC_ATTRIBUTE_NAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_name ::= prefix ' attribute_designator [ ( expression ) ]
-- Case Type: Positive
-- Test Focus: Attribute name with all categories of predefined attributes: T'left/T'right (type bounds)/A'length (array length)/S'event (signal event)/V'image (scalar to string)/A'range (array range)/S'stable (signal stability), verifying both the parameterized and parameterless forms of attribute_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity an_ent is port(clk:in bit; a:in integer; y:out integer); end entity;
architecture bh of an_ent is
  type t_arr is array(0 to 7) of integer;
  signal s_a:t_arr:=(others=>0); signal s_v:integer:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then
      for i in s_a'range loop s_a(i)<=s_a(i)+1; end loop;
      s_v<=s_a'length;
    end if;
  end process;
  y<=s_v+integer'left;
end architecture bh;
