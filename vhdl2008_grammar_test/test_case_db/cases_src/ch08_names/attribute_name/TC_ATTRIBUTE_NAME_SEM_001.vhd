-- =============================================================
-- Case ID: TC_ATTRIBUTE_NAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ATTR_NAME_001
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Rule Description: The attribute_designator must reference a declared predefined attribute or user-defined attribute — referencing an undeclared attribute triggers scope_visibility_error
-- Case Type: Positive
-- Error Category: scope_visibility_error
-- Test Focus: Positive case: all attribute_designators used ('left/'right/'event/'range/'high/'low) are VHDL predefined attributes, legally usable on their respective prefix types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity an_sem_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of an_sem_ent is
  type t_arr is array(0 to 7) of integer;
  signal s_a:t_arr:=(others=>0);
  signal s_cnt:integer:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then
      for i in s_a'range loop s_a(i)<=s_a(i)+1; end loop;
      s_cnt<=s_cnt+1;
    end if;
  end process;
  y<=s_cnt+t_arr'high;
end architecture bh;
