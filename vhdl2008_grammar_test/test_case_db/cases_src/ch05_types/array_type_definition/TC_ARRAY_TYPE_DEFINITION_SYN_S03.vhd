-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_type_definition ::= unbounded_array_definition | constrained_array_definition
-- Case Type: Positive
-- Test Focus: array of custom record type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arr_spc3_ent is port(r:out integer); end entity;
architecture bh of arr_spc3_ent is
  type t_pt is record x,y:integer; end record;
  type t_path is array(0 to 9) of t_pt;
  signal s_path : t_path := (others => (x=>0, y=>0));
begin
  process
  begin
    for i in 0 to 9 loop
      s_path(i) <= (x => i, y => i*2);
    end loop;
    r <= s_path(5).x + s_path(5).y; wait;
  end process;
end architecture bh;
