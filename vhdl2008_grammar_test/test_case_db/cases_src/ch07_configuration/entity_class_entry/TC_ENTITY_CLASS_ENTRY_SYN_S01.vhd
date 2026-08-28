-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Positive (Production-Specific)
-- Test Focus: Exhaustive enumeration of valid entity_class keywords without box — exercises entity_class_entry for each reserved entity_class keyword (entity, architecture, configuration, procedure, function, package, type, subtype, constant, signal, variable, component, label, literal, units, group, file) in group template declarations, verifying all 17 valid entity_class values compile as entity_class_entry
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Supporting design unit for the 'configuration' group constituent
entity cfg_target is
end entity cfg_target;

architecture bh of cfg_target is
begin
end architecture bh;

configuration my_cfg of cfg_target is
  for bh
  end for;
end configuration my_cfg;

entity ece_all_classes is
  generic(
    BUS_WIDTH : integer := 32
  );
  port(
    clk    : in  bit;
    rst_n  : in  bit;
    addr   : in  bit_vector(7 downto 0);
    wdata  : in  bit_vector(BUS_WIDTH-1 downto 0);
    rdata  : out bit_vector(BUS_WIDTH-1 downto 0)
  );
end entity;

architecture rtl of ece_all_classes is
  -- Group templates exercising all 17 entity_class keywords
  group grp_entity        is (entity, architecture);
  group grp_config        is (configuration, procedure);
  group grp_subprograms   is (function, procedure);
  group grp_design_units  is (package, type, subtype);
  group grp_objects       is (constant, signal, variable);
  group grp_structural    is (component, label);
  group grp_misc          is (literal, units, group, file);

  -- Supporting declarations for the group constituents
  package pkg_aux is
    constant c_pkg : integer := 1;
  end package pkg_aux;
  type t_state is (s0, s1);
  subtype t_nibble is bit_vector(3 downto 0);
  type t_phys is range 0 to 1000 units pu; end units t_phys;
  type t_prot is protected
    procedure set_val(v : integer);
  end protected t_prot;
  type t_prot is protected body
    variable val : integer := 0;
    procedure set_val(v : integer) is
    begin val := v; end procedure;
  end protected body t_prot;
  constant c_top : integer := 5;
  shared variable sv_cnt : t_prot;
  signal s_aux : bit;
  component comp_x is
    port(p : in bit; q : out bit);
  end component;
  type t_line is file of string;
  file f_data : t_line;
  procedure p_work(signal s : out bit) is
  begin
    s <= '1';
  end procedure;
  function f_id(x : integer) return integer is
  begin
    return x;
  end function;

  -- Use the group templates
  group g1 : grp_entity        (ece_all_classes, rtl);
  group g2 : grp_config        (work.my_cfg, p_work);
  group g3 : grp_subprograms   (f_id, p_work);
  group g4 : grp_design_units  (pkg_aux, t_state, t_nibble);
  group g5 : grp_objects       (c_top, s_aux, sv_cnt);
  group g6 : grp_structural    (comp_x, u_x);
  group g7 : grp_misc          (s0, pu, g1, f_data);

  signal reg_out : bit_vector(BUS_WIDTH-1 downto 0) := (others => '0');
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      reg_out <= (others => '0');
    elsif clk'event and clk = '1' then
      reg_out <= wdata;
    end if;
  end process;
  u_x : comp_x port map(p => '0', q => s_aux);
  rdata <= reg_out;
end architecture rtl;
