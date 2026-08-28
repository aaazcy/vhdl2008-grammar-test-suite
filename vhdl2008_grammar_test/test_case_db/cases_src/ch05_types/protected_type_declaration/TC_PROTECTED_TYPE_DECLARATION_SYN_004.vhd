-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declaration ::=
--   protected
--     protected_type_declarative_part
--   end protected [ protected_type_simple_name ]
-- Test Focus: Declaration with attribute_specification items
--   inside the declarative part. Tests that attribute specs
--   on subprogram declarations are valid declarative items.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_with_attrs is
  port (
    clk   : in  bit;
    state : out bit
  );
end entity pt_decl_with_attrs;

architecture rtl of pt_decl_with_attrs is
  attribute info : string;
  type t_sema is protected
    procedure lock;
    procedure unlock;
    impure function locked return bit;
    attribute info of lock : procedure is "acquires_mutex";
  end protected;
  type t_sema is protected body
    variable v_locked : bit := '0';
    procedure lock is begin v_locked := '1'; end procedure;
    procedure unlock is begin v_locked := '0'; end procedure;
    impure function locked return bit is begin return v_locked; end function;
  end protected body;
  shared variable sv : t_sema;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.lock;
      state <= sv.locked;
      sv.unlock;
    end if;
  end process;
end architecture rtl;
