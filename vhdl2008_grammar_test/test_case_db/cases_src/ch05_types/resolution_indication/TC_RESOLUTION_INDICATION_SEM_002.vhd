-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SEM_002
-- Related Rule ID: SEM_RESOLUTI_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Case Type: Positive
-- Test Focus: SEMANTIC -- resolution_indication via parenthesized
--            element_resolution form. Tests the alternative syntax
--            where the resolution is specified as a compound element
--            resolution rather than a simple function name.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity res_ind_sem_parenthesized is
  port (
    dout : out integer
  );
end entity res_ind_sem_parenthesized;
architecture rtl of res_ind_sem_parenthesized is
  function max_of(v : int_vec) return integer is
    variable m : integer := integer'low;
  begin for i in v'range loop if v(i) > m then m := v(i); end if; end loop; return m;
  end function;
  type int_vec is array (natural range <>) of integer;
  subtype rmax is max_of integer;
  type t_config is record
    priority : rmax;
    id       : integer;
  end record;
  signal s_cfg : t_config := (priority => 0, id => 1);
begin
  s_cfg.priority <= 5;
  s_cfg.id <= 10;
  dout <= s_cfg.priority + s_cfg.id;
end architecture rtl;
