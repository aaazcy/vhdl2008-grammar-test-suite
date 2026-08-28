-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declaration ::=
--   protected
--     protected_type_declarative_part
--   end protected [ protected_type_simple_name ]
-- Test Focus: ERROR — optional trailing name does not match
--   the type identifier. When present, the simple_name after
--   'end protected' must equal the type name from the type
--   definition.
-- Case Type: Negative
-- Expected Result: Triggers syntax/semantic error
-- =============================================================
entity pt_decl_snn_name_mismatch is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_snn_name_mismatch;

architecture rtl of pt_decl_snn_name_mismatch is
  type t_storage is protected
    procedure save(d : integer);
    impure function load return integer;
  end protected t_storeg;                     -- ERROR: 't_storeg' != 't_storage'
  type t_storage is protected body
    variable v : integer := 0;
    procedure save(d : integer) is begin v := d; end procedure;
    impure function load return integer is begin return v; end function;
  end protected body;
  shared variable sv : t_storage;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.save(55); val <= sv.load;
    end if;
  end process;
end architecture rtl;
